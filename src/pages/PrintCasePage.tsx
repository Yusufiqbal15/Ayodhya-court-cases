import React, { useEffect } from 'react';
import { useParams } from 'react-router-dom';
import { useApp } from '@/contexts/AppContext';
import Header from '@/components/Header';
import CourtNoticeWriter from '@/components/NoticeWriter';

const PrintCasePage: React.FC = () => {
  const { currentLang, isLoggedIn, toggleLanguage } = useApp();
  const { subDepartmentId } = useParams<{ subDepartmentId: string }>();
  
  useEffect(() => {
    // Debug log
    console.log('Printing case with subDepartment ID:', subDepartmentId);
  }, [subDepartmentId]);

  return (
    <>
      <Header isLoggedIn={isLoggedIn} currentLang={currentLang} toggleLanguage={toggleLanguage} />
      <CourtNoticeWriter caseId={subDepartmentId} />
    </>
  );
}
export default PrintCasePage;

